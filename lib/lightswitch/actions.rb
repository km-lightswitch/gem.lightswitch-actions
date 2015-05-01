require 'lightswitch/schedules'

module Lightswitch
  class Actions

    def initialize(schedules_client)
      @schedules = schedules_client
    end

    def get_scheduled_state_changes(current_state, schedules_id, at_time, until_time)
      @schedules.get_scheduled_state_changes(current_state, at_time, until_time, schedules_id)
    end

  end
end