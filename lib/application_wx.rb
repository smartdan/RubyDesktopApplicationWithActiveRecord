begin
  require 'rubygems'
rescue LoadError
end
require 'wx'

include Wx

require 'Head.rb'

class MyFrame < Frame
  def initialize()
        super(nil, -1, 'Windowed App')

        # First create the controls
        @brain = Head::Brain.new
        #@count_users = User.all.length

        @my_panel = Panel.new(self)
        @my_label = StaticText.new(@my_panel, -1, 'Etichetta', DEFAULT_POSITION, DEFAULT_SIZE, ALIGN_CENTER)
        @my_label2 = StaticText.new(@my_panel, -1, '', DEFAULT_POSITION, DEFAULT_SIZE, ALIGN_CENTER)
        @my_textbox = TextCtrl.new(@my_panel, -1, 'Default Textbox Value')
        @my_combo = ComboBox.new(@my_panel, -1, 'Default Combo Text', DEFAULT_POSITION, DEFAULT_SIZE, ['Item 1', 'Item 2', 'Item 3'])
        @my_button = Button.new(@my_panel, -1, 'My Button Text')
        # Bind controls to functions
        evt_button(@my_button.get_id()) { |event| my_button_click(event)}
        # Now do the layout
        @my_panel_sizer = BoxSizer.new(VERTICAL)
        @my_panel.set_sizer(@my_panel_sizer)
        @my_panel_sizer.add(@my_label, 0, GROW|ALL, 2)
        @my_panel_sizer.add(@my_textbox, 0, GROW|ALL, 2)
        @my_panel_sizer.add(@my_combo, 0, GROW|ALL, 2)
        @my_panel_sizer.add(@my_button, 0, GROW|ALL, 2)
        @my_panel_sizer.add(@my_label2, 0, GROW|ALL, 2)

        show()
    end

    def my_button_click(event)
        @my_label2.set_label("Utenti " + event.to_s + " " + @brain.count_users.to_s )
    end

end

class MyApp < App
  def on_init
    MyFrame.new
  end
end

