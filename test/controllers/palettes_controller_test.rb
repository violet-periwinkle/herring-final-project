require "test_helper"

class PalettesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @palette = palettes(:one)
  end

  test "should get index" do
    get palettes_url
    assert_response :success
  end

  test "should get new" do
    get new_palette_url
    assert_response :success
  end

  test "should create palette" do
    assert_difference("Palette.count") do
      post palettes_url, params: { palette: { background: @palette.background, layout: @palette.layout, spacing: @palette.spacing, title: @palette.title, user_id: @palette.user_id } }
    end

    assert_redirected_to palette_url(Palette.last)
  end

  test "should show palette" do
    get palette_url(@palette)
    assert_response :success
  end

  test "should get edit" do
    get edit_palette_url(@palette)
    assert_response :success
  end

  test "should update palette" do
    patch palette_url(@palette), params: { palette: { background: @palette.background, layout: @palette.layout, spacing: @palette.spacing, title: @palette.title, user_id: @palette.user_id } }
    assert_redirected_to palette_url(@palette)
  end

  test "should destroy palette" do
    assert_difference("Palette.count", -1) do
      delete palette_url(@palette)
    end

    assert_redirected_to palettes_url
  end
end
