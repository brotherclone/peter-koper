module GuestBookEntriesHelper
  def which_layout(url1, url2, url3)
    urls = [url1, url2, url3]
    urls.sort_by{|u| u.length}
    urls.reverse
    urls.delete_if { |l| l.length<=1}
    urls
  end
end
