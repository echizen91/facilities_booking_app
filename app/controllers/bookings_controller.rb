class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new

    @today = Date.today
    @tomorrow = Date.today + 1
    @twodayslater = Date.today + 2
    booked = Booking.joins(:room).where('(startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', @today, @tomorrow, @today, @tomorrow).order('rooms.location')
    booked_tomorrow = Booking.joins(:room).where('(startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', @tomorrow, @twodayslater, @tomorrow, @twodayslater).order('rooms.location')

    @datatoday = []
    booked.each do |booking|
      b = [booking.room.location, booking.startdate, booking.enddate]
      @datatoday.push(b)
    end
    
    @datatomorrow = []
    booked_tomorrow.each do |booking|
      b = [booking.room.location, booking.startdate, booking.enddate]
      @datatomorrow.push(b)
    end
    if @datatoday.empty? 
      @datatoday.push(["No Bookings Yet", Date.today, Date.today])
    end
    if @datatomorrow.empty? 
      @datatomorrow.push(["No Bookings Yet", Date.today, Date.today])
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    @today = Date.today
    @tomorrow = Date.today + 1
    @twodayslater = Date.today + 2
    booked = Booking.joins(:room).where('(startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', @today, @tomorrow, @today, @tomorrow).order('rooms.location')
    booked_tomorrow = Booking.joins(:room).where('(startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', @tomorrow, @twodayslater, @tomorrow, @twodayslater).order('rooms.location')

    @datatoday = []
    booked.each do |booking|
      b = [booking.room.location, booking.startdate, booking.enddate]
      @datatoday.push(b)
    end
    
    @datatomorrow = []
    booked_tomorrow.each do |booking|
      b = [booking.room.location, booking.startdate, booking.enddate]
      @datatomorrow.push(b)
    end
    if @datatoday.empty? 
      @datatoday.push(["No Bookings Yet", Date.today, Date.today])
    end
    if @datatomorrow.empty? 
      @datatomorrow.push(["No Bookings Yet", Date.today, Date.today])
    end

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :startdate, :enddate)
    end
end
