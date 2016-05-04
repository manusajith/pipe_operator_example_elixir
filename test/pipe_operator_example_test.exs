defmodule PipeOperatorExampleTest do
  use ExUnit.Case
  doctest PipeOperatorExample

  test "ps_ax outputs some processes" do
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
    assert Unix.ps_ax == output
  end

  test "grep(lines, thing) returns lines that match `thing`" do
    lines = """
    foo
    bar
    baz
    thing foo
    thing baz
    """
    output = ["thing foo", "thing baz"]
    assert Unix.grep(lines, ~r/thing/) == output
  end

  test "awk(input, 1) splits on whitespace and returns the first column" do
    input = ["foo bar", "baz"]
    output = ["foo", "baz"]
    assert Unix.awk(input,1 ) == output
  end

  test "the whole pipeline works" do
    assert(Unix.ps_ax |> Unix.grep(~r/tmux/) |> Unix.awk(1) == ["35742"])
  end
end
