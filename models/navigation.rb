class Navigation
  include Tapestry

  element :page_list, id: 'navlist'

  element :stardate, id: 'stardate'
  element :warp,     id: 'warp'
  element :planets,  id: 'planets'
  element :overlord, id: 'overlord'

  element :stardate_logo, id:  'stardate-logo'
  element :warp_logo,     id:  'warp-logo'
  element :planet_logo,   id:  'planet-logo'
  image   :overlord_logo, src: 'images/mad-scientist.png'

  element :error, id: 'flash'

  def navigate
    self
  end

  def to_overlord_page(expect_fail = nil)
    open_page_list
    overlord.click
    expect(overlord_logo.exists?).to be true unless expect_fail
    admin_only_error if expect_fail
  end

  def to_stardate_page
    open_page_list
    stardate.click
    expect(stardate_logo.exists?).to be true
  end

  private

  def open_page_list
    page_list.wait_until(&:dom_updated?).click
  end

  def admin_only_error
    expect(error.text).to eq('This content requires admin access.')
  end
end
