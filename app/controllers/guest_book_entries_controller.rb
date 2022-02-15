class GuestBookEntriesController < InheritedResources::Base

  private

    def guest_book_entry_params
      params.require(:guest_book_entry).permit()
    end

end
