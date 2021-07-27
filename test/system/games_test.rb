require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Ir a new, llenar el input y click en el submit y comprobar la respuesta" do
    visit new_url
    fill_in "word", with: "asdasd"
    click_on "Play"

    assert_text "Sorry but ASDASD can't be built out of"
  end
end
