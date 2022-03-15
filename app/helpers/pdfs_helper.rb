module PdfsHelper
  def show_adobe_id
    ENV["PDF_EMBED_API_KEY"]
  end
  def show_pdf_file(file_url)
    file_url.to_s.match /(\w+)((\.\w{2,4}){1,10})$/
  end
end