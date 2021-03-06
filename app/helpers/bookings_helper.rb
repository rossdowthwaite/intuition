module BookingsHelper

	#  check if all appointments have been confirmed for a booking
   def confirmed(booking)
      @booked = booking.appointments.where( :confirmed => true )
      if @booked.count == booking.appointments.count
         return true
      elsif @booked.count == booking.appointments.count
         return false
      end
   end

   # returns the number of appointments for a booking
   def appointment_count(booking)
      return booking.appointments.count
   end

   # Checks if the current user is booked
   def am_i_confirmed(booking)
      @my_appointment = booking.appointments.where(:user_id => current_user.id).first
      return @my_appointment.confirmed
   end

   # Checks if the particiluar appointment is the current users
   def my_appointment(appointment)
      if appointment.user_id == current_user.id
         return true
      else
         return false
      end
   end

   # Checks the personal booking status
   # returns some styling
   def my_booking_status(booking)
      if booking.appointments.my_appointment(current_user).first.confirmed == nil
         @my_status_icon = '<i class="fa fa-exclamation-circle fa-2x tab_icons" title="Requires Action!!"></i>'
      elsif booking.appointments.my_appointment(current_user).first.status == "DoubleBooked"
         @my_status_icon = '<i class="fa fa-random fa-2x tab_icons" title="Double Booked"></i>'
      elsif booking.appointments.my_appointment(current_user).first.confirmed == false
         @my_status_icon = '<i class="fa fa-thumbs-o-down fa-2x tab_icons" title="Booked in!"></i>'
      else
         @my_status_icon = '<i class="fa fa-thumbs-o-up fa-2x tab_icons" title="Booked in!"></i>'
      end
   end

   # Checks the overall booking status
   def booking_status(booking) 
      @appointments = booking.appointments
      @booked = @appointments.is_confirmed
      @rejected = @appointments.rejected
      @pending = @appointments.pending

      if confirmed(booking) 
         @booking_status_icon = '<i class="fa fa-ticket fa-2x tab_icons" title="Booked in!"></i>'
         @class = 'accepted'
      elsif @appointments.rejected.count == @appointments.count - 1 
         @booking_status_icon = '<i class="fa fa-times-circle fa-2x tab_icons" title="Requires Action"></i>'
         @class = 'action'
      elsif @appointments.double_booked.count > 0
         @booking_status_icon = '<i class="fa fa-random fa-2x tab_icons" title="Requires Action"></i>'
      else
         @booking_status_icon = '<i class="fa fa-clock-o fa-2x tab_icons" title="Pending"></i>'
         @class = 'standard'
      end
   end


   def set_status_style(bool)
      if bool
         @class = 'accepted'
      else
         @class = 'action'
      end
   end 

   def double_booked(booking)
      @apps = booking.appointments
      @apps.each do |app|
         if app.status == "DoubleBooked" 
            @class = 'doubleBooked' 
         end
      end
   end
 
end
