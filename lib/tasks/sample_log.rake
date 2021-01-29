desc "This task is called by the Heroku scheduler add-on"
task :puts_log_time => :environment do

  time_now = Time.now
  Rails.logger.info "----------------------------"
  Rails.logger.info "start"
  Rails.logger.info "now time is #{time_now}"
  Rails.logger.info "done."
  Rails.logger.info "----------------------------"
end