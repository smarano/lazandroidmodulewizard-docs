{Hint: save all files to location: C:\adt32\eclipse\workspace\AppActionBarTabDemo1\jni }
unit unit1;
  
{$mode delphi}
  
interface
  
uses
  Classes, SysUtils, And_jni, And_jni_Bridge, Laz_And_Controls, 
    Laz_And_Controls_Events, AndroidWidget, actionbartab;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
      jActionBarTab1: jActionBarTab;
      jButton1: jButton;
      jButton2: jButton;
      jCheckBox1: jCheckBox;
      jEditText1: jEditText;
      jEditText2: jEditText;
      jImageView1: jImageView;
      jListView1: jListView;
      jPanel1: jPanel;
      jPanel2: jPanel;
      jPanel3: jPanel;
      jPanel4: jPanel;
      jTextView1: jTextView;
      jTextView2: jTextView;
      jTextView3: jTextView;

      procedure AndroidModule1JNIPrompt(Sender: TObject);
      procedure jActionBarTab1TabSelected(Sender: TObject; view: jObject;
        title: string);
      procedure jActionBarTab1UnSelected(Sender: TObject; view: jObject;
        title: string);
      procedure jButton1Click(Sender: TObject);
      procedure jButton2Click(Sender: TObject);

    private
      {private declarations}
    public
      {public declarations}
  end;
  
var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
   //prepare custom tab view - jPanel3
    jTextView3.TextTypeFace:= tfBold;
    jImageView1.SetImageByIdentifier('ic_bullet_red');                                  //...\res\drawable-xxx

    Self.SetIconActionBar('ic_bullets');

    jActionBarTab1.Add('NAME', jPanel1.View{sheet view}, 'ic_bullet_green');            // ...\res\drawable-xxx
    jActionBarTab1.Add('ADDRESS', jPanel2.View {sheet view}, 'ic_bullet_yellow');       //...\res\drawable-xxx

    jActionBarTab1.Add('ADDLIST', jPanel4.View {sheet view}, jPanel3.View {custom tab view!});

    Self.SetTabNavigationModeActionBar;  //this is needed!!!

    //prepare custom tab view - jPanel3
    jCheckBox1.Checked:= True;

end;

procedure TAndroidModule1.jActionBarTab1TabSelected(Sender: TObject;
  view: jObject; title: string);
begin
    //ShowMessage('Tab Selected: '+title);
end;

procedure TAndroidModule1.jActionBarTab1UnSelected(Sender: TObject;
  view: jObject; title: string);
begin
    ShowMessage('Tab Un Selected: '+title);
end;

procedure TAndroidModule1.jButton1Click(Sender: TObject);
begin
  if jCheckBox1.Checked then jListView1.Add(jEditText1.Text)
  else ShowMessage(jEditText1.Text + ': Not Listed!');
end;

procedure TAndroidModule1.jButton2Click(Sender: TObject);
begin
    if jCheckBox1.Checked then jListView1.Add(jEditText2.Text)
    else ShowMessage(jEditText2.Text + ': Not Listed!');
end;

end.
