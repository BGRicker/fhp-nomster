module Features
  def display_place(place_title)
    have_css ".places li", text: place_title
  end
end
