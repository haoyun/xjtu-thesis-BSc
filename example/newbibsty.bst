ENTRY
  { author%主要责任者
    title%文献题名
    type%文献类型标志
    otherauthor%其他责任者
    edition%版本
    pubaddress%出版地
    publisher%出版者
    pubyear%出版年
    pages%引用页码
    theurl%获取和访问途径
    inauthor%析出文献主要责任者
    intitle%析出文献题名
    inotherauthor%析出文献其他责任者
    othertitle%其他题名信息
    volume%卷(期)
    lastvolume%终止卷
    latestyear%终止年
    nation%专利国别
    number%专利号
    date%公告日期或公开日期
    mediatype%载体标志
    lang%语言
}{}{label}

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}


FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

STRINGS{ r }

FUNCTION {addperiod.zh}
{
  duplicate$ #-1 #-1 substring$ 'r :=
  r "}" =
  r "." =
  or
  r "?" =
  or
  r "!" =
  or
    'skip$
    {"。" *}
  if$
  "" 'r :=
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}


FUNCTION {islangzh}
{
  lang missing$
    {#0}
    {lang "zh" =}
  if$
}

STRINGS { s t }

FUNCTION {output.nonnull}%标点符号修改地
{ 's :=
  lang missing$
    {#0}
    {lang "zh" =}
  if$
    {
      output.state mid.sentence =
      { "，" * write$ }
      { output.state after.block =
          { addperiod.zh write$
            newline$
            "\newblock " write$
          }
          { output.state before.all =
              'write$
              { addperiod.zh " " * write$ }
            if$
          }
	if$
	mid.sentence 'output.state :=
      }
      if$
    }
    {output.state mid.sentence =
       { ", " * write$ }
       { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
	 if$
	 mid.sentence 'output.state :=
       }
     if$
    }
  if$
  s
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

INTEGERS { nameptr namesleft numnames ifothers}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  #0 'ifothers :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    
  {
    namesleft #0 >
    nameptr #4 <
    and
  }%至多显示三个人名
  {
    lang missing$
    {#0}
    {lang "zh" =}
    if$
    { s nameptr "{ll}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
            { "," * t * }
            { numnames #2 >
		{ "," * }
		'skip$
            if$
            t "等" =
              {
		" 等" * 
		#1 'ifothers :=
	      }
              'skip$
            if$
            }
          if$
	}
        't
      if$
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
    }
    { s nameptr "{ll}{ f}{j}{v}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
            { ", " * t * }
            { numnames #2 >
		{ "," * }
		'skip$
            if$
            t "et~al." =
              {
		" et~al." * 
		#1 'ifothers :=
	      }
              'skip$
            if$
            }
          if$
	}
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
    if$
  }
  while$
  numnames #3 >
  ifothers not
  and
    {
      lang missing$
	{#0}
	{lang "zh" =}
      if$
	{" 等" * }
	{" et~al." *}
      if$
    }
    'skip$
  if$
}

STRINGS{n}

FUNCTION {format.authors}
{ 'n :=
  n empty$
    { "" }
    { n format.names }
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {format.btitle}
{ title %emphasize
}

FUNCTION {pubinformation}
{
  pubaddress missing$
    {publisher}
    {pubaddress ":" * publisher *}
  if$
}
  
FUNCTION {fin.entry}
{ 
  lang missing$
    {#1}
    {lang "zh" =}
  if$
    'add.period$
    'addperiod.zh
  if$
  write$
  newline$
}

FUNCTION {book}%专著
{ output.bibitem
  %主要责任者
  author format.authors output.nonnull
  new.block
  %标题
  format.btitle "title" output.check
   %文献类型标志
  type missing$
    'skip$
    {"[" type * "]" * *}
  if$
  new.block
  %其他主要责任者
  otherauthor missing$
    'skip$  
    {otherauthor format.authors output}
  if$
  new.block
  %版本
  edition missing$
    'skip$
    {edition output}
  if$
  %出版信息
  pubinformation output
  %页码
  pages missing$
    {pubyear output}
    {pubyear ":" * pages * output.nonnull}
  if$
  %获取和访问途径
  new.block
  theurl missing$
    'skip$
    {theurl output}
  if$

  fin.entry
}



READ

STRINGS {longest.label}

INTEGERS {number.label longest.label.width}

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
