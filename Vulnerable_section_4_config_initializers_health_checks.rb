require "ok_computer/ok_computer_controller"

 Rails.application.configure do
   config.after_initialize do
     OkComputer::Registry.register "worker", OpenProject::HealthChecks::GoodJobCheck.new