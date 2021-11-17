defmodule DateTimePrac do
  def time() do
    DateTime.to_iso8601(DateTime.utc_now())
  end

  def diff(time) do
    Time.diff(Time.utc_now(), time)
  end
end
