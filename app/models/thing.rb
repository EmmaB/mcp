class Thing < ApplicationRecord

  def on
    put(action.change_lights(proprietary_id), action.on)
  end

  def off
    put(action.change_lights(proprietary_id), action.off)
  end

  private

  delegate  :put,
            to: :connection

  def connection
    "Connection::#{proprietary_name}".constantize
  end

  def action
    "Adaptors::#{proprietary_name}".constantize
  end
end
