# README

# Event Booking System (API)

## Setup Instructions

1. Clone the repository
   git clone <repo_url>
   cd event_booking_system
   
2. Install dependencies
   bundle install

3. Setup the database
    rails db:create db:migrate

4. Start the server
    rails server

5. Run Sidekiq for background jobs
    sidekiq


6. API Endpoints
    User Authentication: POST /users/sign_in
    List Events: GET /events
    Create Event (Organizer only): POST /events
    Update Event (Organizer only): PATCH /events/:id
    Book Ticket (Customer only): POST /bookings
