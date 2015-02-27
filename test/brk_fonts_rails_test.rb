require 'test_helper'

class BrkFontsRailsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "Load engine" do
    assert_equal ::Rails::Engine, BrkFonts::Rails::Engine.superclass
  end

  test "Fonts found" do
    get "/assets/brk-font.eot"
    assert_response :success
    get "/assets/brk-font.ttf"
    assert_response :success
    get "/assets/brk-font.woff"
    assert_response :success
    get "/assets/brk-font.svg"
    assert_response :success
  end

  test "Stylesheet found" do
    get "/assets/brk-fonts.css"
    assert_brk_fonts(response)
  end

  test "stylesheets have correct references to the fonts" do
    get "/assets/brk-fonts.css"
    v = BrkFonts::Rails::VERSION
    assert_match "/assets/brk-font.eot?v=#{v}",  response.body
    assert_match "/assets/brk-font.eot?#iefix&v=#{v}", response.body
    assert_match "/assets/brk-font.woff?v=#{v}", response.body
    assert_match "/assets/brk-font.ttf?v=#{v}",  response.body
    assert_match "/assets/brk-font.svg?v=#{v}", response.body
  end

  test "stylesheet is available in a css sprockets require" do
    get "/assets/sprockets-require.css"
    assert_brk_fonts(response)
  end

  test "stylesheet is available in a sass import" do
    get "/assets/sass-import.css"
    assert_brk_fonts(response)
  end

  test "stylesheet is available in a scss import" do
    get "/assets/scss-import.css"
    assert_brk_fonts(response)
  end

  test "helpers should be available in the view" do
    get "/icons"
    assert_response :success
    assert_select "i.brk.brk-rails"
    assert_select "i.brk.brk-ruby.brk-2x"
    assert_match(
      "Fear the snake <i class=\"brk brk-python\"></i>", response.body)
    assert_match(
      "<i class=\"brk brk-mirlodev brk-4x pull-left\"></i>", response.body)
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end

  def assert_brk_fonts(response)
    assert_response :success
    assert_match(/font-family:\s*'brkfont';/, response.body)
  end
end
