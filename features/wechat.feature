Feature:Wechat widget

  As a student
  I can open widget of we chat
  So I can scan QR code on we chat

  Scenario: Open left floating widget on home page
    Given I'm on CN homepage 
    When I click left floating widget 
    Then I should see "扫二维码立即开始啰！" on the popup window
    Then I can close the popup window
  
  Scenario: Open wechat social widget on home page 
    Given I'm on CN homepage 
    When I click wechat on social widget 
    Then I should see "扫二维码立即开始啰！" on the popup window
    Then I can close the popup window
  
  Scenario: Open wechat long banner on help page
    Given I'm on help page 
    When I click wechat long banner 
    Then I should see "扫二维码立即开始啰！" on the popup window
    Then I can close the popup window
  
  Scenario: Open wechat short banner on SRP page
    Given I'm on SRP page 
    When I click wechat short banner 
    Then I should see "扫二维码立即开始啰！" on the popup window
    Then I can close the popup window