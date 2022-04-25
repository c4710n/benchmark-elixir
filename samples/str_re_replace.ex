defmodule Teo do
  @pattern_number ~S"\p{N}+"
  @pattern_alphanumber ~S"[\p{N}\p{L}]+"

  def re_replace(string) do
    Enum.reduce_while(
      [
        &replace_re_number/1,
        &replace_re_trailing_number/1,
        &replace_re_uuid/1,
        &replace_re_trailing_uuid/1
      ],
      string,
      fn func, acc ->
        replaced_string = func.(acc)

        if replaced_string != string do
          {:halt, replaced_string}
        else
          {:cont, string}
        end
      end
    )
  end

  def re_replace_alt(string) do
    Enum.reduce_while(
      [
        &replace_re_uuid/1,
        &replace_re_trailing_uuid/1,
        &replace_re_number/1,
        &replace_re_trailing_number/1
      ],
      string,
      fn func, acc ->
        replaced_string = func.(acc)

        if replaced_string != string do
          {:halt, replaced_string}
        else
          {:cont, string}
        end
      end
    )
  end

  defp replace_re_number(string) do
    {:ok, re} = Regex.compile("_#{@pattern_number}_")
    String.replace(string, re, "_*_")
  end

  defp replace_re_trailing_number(string) do
    {:ok, re} = Regex.compile("_#{@pattern_number}$")
    String.replace(string, re, "_*")
  end

  defp replace_re_uuid(string) do
    {:ok, re} =
      Regex.compile(
        "_#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}_"
      )

    String.replace(string, re, "_*_")
  end

  defp replace_re_trailing_uuid(string) do
    {:ok, re} =
      Regex.compile(
        "_#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}-#{@pattern_alphanumber}$"
      )

    String.replace(string, re, "_*")
  end
end

Benchee.run(
  %{
    "re_replace" => &Teo.re_replace/1,
    "re_replace_alt" => &Teo.re_replace_alt/1
  },
  inputs: %{
    "1. number" => "USER_1166_V17",
    "2. trailing_number" => "USER_V17_1166",
    "3. UUID" => "SNAPSHOT_1352eb75-a506-47bb-a2ea-1e2e2c9728d8_V2",
    "4. trailing UUID" => "SNAPSHOT_V2_1352eb75-a506-47bb-a2ea-1e2e2c9728d8"
  }
)
