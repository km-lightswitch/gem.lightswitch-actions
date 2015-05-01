require_relative 'test_helper'

context "Lightswitch::Actions" do

  context "#get_scheduled_state_changes" do
    setup {
      schedules = Lightswitch::Schedules.new
      schedules.create_schedule_collection({
                                               name: 'test',
                                               schedules: [{
                                                               start: '0900', end: '1800'
                                                           }]
                                           })
    }

    asserts("gets scheduled state changes from the lightswitch-schedules gem") {
      Lightswitch::Actions.new(Lightswitch::Schedules.new).get_scheduled_state_changes('down', topic, Time.new(2015, 5, 1, 10, 25, 0), Time.new(2015, 5, 1, 10, 35, 0)).first.equal?(Lightswitch::StateChange.new('up', Time.new(2015, 5, 1, 10, 25, 0)))
    }


  end

end