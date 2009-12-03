begin
  require 'rubygems'
rescue LoadError
end

require 'fox16'
require 'Head.rb'

include Fox



class DanMainWindow < FXMainWindow
  def initialize(anApp)
    @mind = Head::Brain.new
   
    # Initialize base class first
    super(anApp, "La finestrella", :opts => DECOR_ALL, :width => 400, :height => 300)

    # Place the list in a sunken frame
    sunkenFrame = FXVerticalFrame.new(self,
    LAYOUT_FILL_X|LAYOUT_FILL_Y|FRAME_SUNKEN|FRAME_THICK, :padding => 0)
    
    # Horizontal frame contains buttons
    buttons = FXHorizontalFrame.new(self, LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|PACK_UNIFORM_WIDTH)

    # Cut and paste buttons
    copyButton  = FXButton.new(buttons, "Copy")
    pasteButton = FXButton.new(buttons, "Paste")    
    
    # Customer list
    usersList = FXList.new(sunkenFrame, :opts => LIST_BROWSESELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)
    @mind.users.each do | user |
      usersList.appendItem(user.name, nil, user)
    end
    
    
    
    # User clicks Copy
     copyButton.connect(SEL_COMMAND) do
       user = usersList.getItemData(usersList.currentItem)
       types = [ FXWindow.stringType ]
       if acquireClipboard(types)
         @clippedUser = user
       end
     end
     
     # Handle clipboard request
     self.connect(SEL_CLIPBOARD_REQUEST) do
       setDNDData(FROM_CLIPBOARD, FXWindow.stringType, Fox.fxencodeStringData(@clippedUser.to_s))
     end
     
     
  end
  
  def create
    super
    show(PLACEMENT_SCREEN)
  end
  
 
  
end

if __FILE__ == $0
  FXApp.new("Finestrella utenti", "FXRuby-S1") do |theApp|
    DanMainWindow.new(theApp)
    theApp.create
    theApp.run
  end
end

