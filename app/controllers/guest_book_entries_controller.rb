class GuestBookEntriesController < InheritedResources::Base

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Guest Book", :guest_book_entries_path

  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @entries = GuestBookEntry.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @entries}
    end
  end

  def show
    add_breadcrumb @entry.title.to_s, guest_book_entries_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @entry}
    end
  end

  def new
    @entry = GuestBookEntry.new
  end

  def edit

  end

  def create
    @entry = GuestBookEntry.new(guest_book_entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to guest_book_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_guest_book_entry
    @entry = GuestBookEntry.find(params[:id])
  end

  def guest_book_entry_params
    params.require(:guest_book_entry).permit(:title, :body, :guest_name, :guest_email)
  end

end
