unit ps4_libSceSharePlay;

{$mode ObjFPC}{$H+}

interface

uses
 ps4_program;

implementation

function ps4_sceSharePlayInitialize(pHeap:Pointer;heapSize:qword):Integer; SysV_ABI_CDecl;
begin
 Writeln('sceSharePlayInitialize:',HexStr(pHeap),':',heapSize);
 Result:=0;
end;

function Load_libSceSharePlay(Const name:RawByteString):TElf_node;
var
 lib:PLIBRARY;
begin
 Result:=TElf_node.Create;
 Result.pFileName:=name;

 lib:=Result._add_lib('libSceSharePlay');

 lib^.set_proc($8ACAEEAAD86961CC,@ps4_sceSharePlayInitialize);
end;

initialization
 ps4_app.RegistredPreLoad('libSceSharePlay.prx',@Load_libSceSharePlay);

end.
