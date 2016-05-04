defmodule PipeOperatorExample do

end


defmodule Unix do
  def ps_ax do
    output = """
      PID     TT  STAT   TIME    COMMAND
      92167   ??  S      0:23.54 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      92193   ??  S      0:34.67 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      92493   ??  S      0:55.48 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      92618   ??  S      0:37.16 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      94428   ??  S      2:35.35 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      95389   ??  S      1:03.30 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      99674   ??  S     11:25.40 /Applications/Google Chrome.app/Contents/Versions/50.0.2661.86
      35742 s000  S+     0:00.01 tmux attach
    """
  end

  def grep(input, match) do
    String.split(input, "\n")
      |> Enum.filter(fn (line) ->  Regex.match?(match, line)  end)
  end

  def awk(lines, column) do
    Enum.map(lines, fn line ->
      String.strip(line)
        |> Unix.regex_split(~r/ /)
        |> Enum.at(column-1)
    end)
  end

  def regex_split(lines, regex) do
    Regex.split(regex, lines, trim: true)
  end
end
