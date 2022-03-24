class GuestBookEntriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Drop a Memory", :guest_book_entries_path

  before_action :set_guest_book_entry, only: [:show, :edit, :update, :destroy]

  def index
    @show_breadcrumbs = true
    @guest_book_entries = GuestBookEntry.all.where(admin_state: :accepted)
    @current = "drop"
    respond_to do |format|
      format.html { render :index}
    end
  end

  def show
    add_breadcrumb @guest_book_entry.title.to_s, guest_book_entries_path
    @show_breadcrumbs = true
    @current = "drop"
    respond_to do |format|
      format.html { render :show}
    end
  end

  def new
    @guest_book_entry = GuestBookEntry.new
    @display_challenge_failed = false
  end

  def edit
  end

  def update
    if @guest_book_entry.update(guest_book_entry_params)
      redirect_to @guest_book_entry
    else
      respond_to do |format|
        format.html { render :edit}
      end
    end
  end

  def create
    @guest_book_entry = GuestBookEntry.new(guest_book_entry_params)
    respond_to do |format|
      if @guest_book_entry.save
        format.html { redirect_to @guest_book_entry, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @guest_book_entry.destroy
    respond_to do |format|
      format.html { redirect_to guest_book_entries_url, notice: 'Entry was successfully destroyed.' }
    end
  end

  private

  def set_guest_book_entry
    @guest_book_entry = GuestBookEntry.find(params[:id])
  end

  def guest_book_entry_params
    params.require(:guest_book_entry).permit(:title,
                                             :body,
                                             :image_one_url,
                                             :image_one_url_cache,
                                             :image_two_url,
                                             :image_two_url_cache,
                                             :image_three_url,
                                             :image_three_url_cache,
                                             :guest_email,
                                             :guest_name,
                                             :admin_state)
  end

end
