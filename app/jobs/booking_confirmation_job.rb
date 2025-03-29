class BookingConfirmationJob < ApplicationJob
  queue_as :default

  def perform(booking_id)
    booking = Booking.find(booking_id)
    puts "Email Confirmation: Ticket booked for #{booking.event.name} by #{booking.customer.user.email}"
  end
end
