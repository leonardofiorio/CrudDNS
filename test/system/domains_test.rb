require "application_system_test_case"

class DomainsTest < ApplicationSystemTestCase
  setup do
    @domain = domains(:one)
  end

  test "visiting the index" do
    visit domains_url
    assert_selector "h1", text: "Domains"
  end

  test "creating a Domain" do
    visit domains_url
    click_on "New Domain"

    fill_in "Contact", with: @domain.contact
    fill_in "Expire", with: @domain.expire
    fill_in "Minimum", with: @domain.minimum
    fill_in "Name", with: @domain.name
    fill_in "Primary name server", with: @domain.primary_name_server
    fill_in "Refresh", with: @domain.refresh
    fill_in "Retry", with: @domain.retry
    fill_in "Ttl", with: @domain.ttl
    fill_in "Type", with: @domain.type
    click_on "Create Domain"

    assert_text "Domain was successfully created"
    click_on "Back"
  end

  test "updating a Domain" do
    visit domains_url
    click_on "Edit", match: :first

    fill_in "Contact", with: @domain.contact
    fill_in "Expire", with: @domain.expire
    fill_in "Minimum", with: @domain.minimum
    fill_in "Name", with: @domain.name
    fill_in "Primary name server", with: @domain.primary_name_server
    fill_in "Refresh", with: @domain.refresh
    fill_in "Retry", with: @domain.retry
    fill_in "Ttl", with: @domain.ttl
    fill_in "Type", with: @domain.type
    click_on "Update Domain"

    assert_text "Domain was successfully updated"
    click_on "Back"
  end

  test "destroying a Domain" do
    visit domains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Domain was successfully destroyed"
  end
end
