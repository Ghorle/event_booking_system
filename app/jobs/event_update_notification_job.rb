class EventUpdateNotificationJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    customers = event.bookings.includes(:customer).map(&:customer)

    customers.each do |customer|
      puts "Email Notification: Event #{event.name} has been updated. Notifying #{customer.user.email}"
    end
  end
end
