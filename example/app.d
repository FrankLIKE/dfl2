// Written by Christopher E. Miller
// This code is public domain.

// To compile:
// 	vs2010 


private import std.string, std.conv;

private import dfl.all, dfl.internal.utf;


class MainForm: Form
{
	uint docnum = 0;
	
	this()
	{	 
		text = "DFL MDI";
		startPosition = FormStartPosition.WINDOWS_DEFAULT_BOUNDS;
		
		MenuItem mi;
		menu = new MainMenu;
		
		with(mi = new MenuItem)
		{
			text = "New";
			
			click ~= &menubar_click;
		}
		menu.menuItems.add(mi);
		
		isMdiContainer = true;
		
		addChild();
	}
	
	
	private void mdiChildHiClick(Object sender, EventArgs ea)
	{
		Button btn;
		btn = cast(Button)sender;
		assert(btn);
		
		Form f;
		f = cast(Form)btn.parent;
		assert(f);
		
		f.close();
	}
	
	
	final void addChild()
	{
		Form f;
		with(f = new Form)
		{
			text = "MDI child #" ~ std.conv.to!string(++docnum) ~ "/" ~ std.conv.to!string(this.mdiChildren().length + 1);
			mdiParent = this;
			
			with(new Button)
			{
				text = "&Hi";
				location = Point(42, 42);
				parent = f;
				click ~= &mdiChildHiClick;
			}
			
			show();
		}
	}
	
	
	private void menubar_click(Object sender, EventArgs ea)
	{
		addChild();
	}
}


int main()
{
	int result = 0;
	
	try
	{
		// Application initialization code here.
		
		Application.run(new MainForm());
	}
	catch(DflThrowable o)
	{
		msgBox(o.toString(), "Fatal Error", MsgBoxButtons.OK, MsgBoxIcon.ERROR);
		
		result = 1;
	}
	
	return result;
}

