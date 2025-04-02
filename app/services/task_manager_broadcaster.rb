# /home/dhara/projects/hackathon_020425/app/services/task_manager_broadcaster.rb

class TaskManagerBroadcaster
  def self.broadcast(task_manager, action: :create)
    puts "----------- Broadcasting task_manager #{action}: #{task_manager.title}"

    case action
    when :create
      Turbo::StreamsChannel.broadcast_prepend_to(
        "task_managers",
        target: "task_managers-list",
        partial: "task_managers/index",
        locals: { task_manager: task_manager }
      )
    # when :update
    #   Turbo::StreamsChannel.broadcast_replace_to(
    #     "task_managers",
    #     target: dom_id(task_manager, "id"),
    #     partial: "task_managers/index",
    #     locals: { task_manager: task_manager }
    #   )
    end
    # broadcast_task_manager_count
    # broadcast_analytics
    Turbo::StreamsChannel.broadcast_replace_to(
      "task_managers_analytics",
      target: "show-counts",
      partial: "task_managers/index",
      # html: "<div>New article!</div>"
      locals: {
        total_task_managers_count: ::TaskManager.count,
        completed_task_managers: ::TaskManager.where(status: 'completed').count,
        pending_task_managers: ::TaskManager.where(status: 'to_do').count
      }
    )
  end

  def self.broadcast_task_manager_count
    task_managers_count = TaskManager.count
    Turbo::StreamsChannel.broadcast_update_to("task_managers", target: "task_manager_count", html: task_managers_count.to_s)
  end

  def self.broadcast_analytics
    Turbo::StreamsChannel.broadcast_replace_to(
      "task_managers",
      target: "show-counts",
      partial: "task_managers/index",
      locals: {
        total_task_managers: TaskManager.count,
        completed_task_managers: TaskManager.where(status: 'completed').count,
        pending_task_managers: TaskManager.where(status: 'to_do').count
      }
    )
  end

end