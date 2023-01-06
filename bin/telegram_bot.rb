#!/usr/bin/env ruby

begin
  ENV['BOT_POLLER_MODE'] = 'true'
  require_relative '../config/environment'
  Telegram::Bot::UpdatesPoller.start(ENV['BOT_NAME'].to_sym)
rescue Exception => e
  Sentry.capture_exception(e) && !e.is_a?(SystemExit)
  raise
end