class ApplicationDetailsPage
  include PageObject

  link :my_account_link, :class => "primary-link subnav-link my-account"
  link :logout_link, :href => "/my-account/logout"
end
