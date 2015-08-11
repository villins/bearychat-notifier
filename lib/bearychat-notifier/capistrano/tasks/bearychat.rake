require 'bearychat-notifier'

namespace :bearychat do
  task :notify_deploy_started do
    attachments = [{title: "#{default_title('is deploying')}" , color: starting_color }]
    send_message nil, attachments
  end

  task :notify_deploy_finished do
    attachments = [{title: "#{default_title('finished deploying')}",  color: successed_color }]
    send_message nil, attachments
  end

  task :notify_deploy_fail do
    attachments = [{title: "#{default_title('cancelled deployment of')}", color: failed_color }]
    send_message nil, attachments
  end

  before 'deploy:starting', 'bearychat:notify_deploy_started'
  after 'deploy:finishing', 'bearychat:notify_deploy_finished'
  if Rake::Task.task_defined? 'deploy:failed'
    after 'deploy:failed', 'bearychat:notify_deploy_fail'
  end

  def git_user
    `git config user.name`.gsub "\n", ''
  end

  def failed_color
    fetch(:bearychat_failed_color, "#E51C23")
  end

  def successed_color
    fetch(:bearychat_successed_color, "#259B24")
  end

  def starting_color
    fetch(:bearychat_starting_color, "#FFC107")
  end

  def default_title(action)
    "#{git_user} #{action} #{deployment_info} to #{stage_string} @ #{Time.now}."
  end

  def deployment_info
    "#{fetch(:application)}/#{fetch(:branch)} (#{fetch(:current_revision)})"
  end

  def stage_string
    fetch(:stage)
  end

  def send_message(text, attachments)
    return unless enabled?
    return unless bearychat_hook = fetch(:bearychat_hook)
    text ||= "#{fetch(:application)} deployment:"
    Bearychat::Notifier.new(bearychat_hook, { attachments: attachments }).ping text
  end

  def enabled?
    fetch(:bearychat_enabled, true)
  end

end
