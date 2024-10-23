## HTML 速查列表

### HTML 基本文档
* ```html
  <!DOCTYPE html>
  <html>
  <head>
  <title>文档标题</title>
  </head>
  <body>
  可见文本...
  </body>
  </html>
  ```

### 基本标签（Basic Tags）
* ```html
  <h1>最大的标题</h1>
  <h2> . . . </h2>
  <h3> . . . </h3>
  <h4> . . . </h4>
  <h5> . . . </h5>
  <h6>最小的标题</h6>
  <p>这是一个段落。</p>
  <br> （换行）
  <hr> （水平线）
  <!-- 这是注释 -->
  ```

### 文本格式化（Formatting）
* ```html
  <b>粗体文本</b>
  <code>计算机代码</code>
  <em>强调文本</em>
  <i>斜体文本</i>
  <kbd>键盘输入</kbd> 
  <pre>预格式化文本</pre>
  <small>更小的文本</small>
  <strong>重要的文本</strong>
  <abbr> （缩写）
  <address> （联系信息）
  <bdo> （文字方向）
  <blockquote> （从另一个源引用的部分）
  <cite> （工作的名称）
  <del> （删除的文本）
  <ins> （插入的文本）
  <sub> （下标文本）
  <sup> （上标文本）
  ```

### 链接（Links）
* ```html
  普通的链接：<a href="http://www.example.com/">链接文本</a>
  图像链接： <a href="http://www.example.com/"><img src="URL" alt="替换文本"></a>
  邮件链接： <a href="mailto:webmaster@example.com">发送e-mail</a>
  书签：
  <a id="tips">提示部分</a>
  <a href="#tips">跳到提示部分</a>
  ```

### 图片（Images）
* ```html
  <img loading="lazy" src="URL" alt="替换文本" height="42" width="42">
  ```

### 样式/区块（Styles/Sections）
* ```html
  <style type="text/css">
  h1 {color:red;}
  p {color:blue;}
  </style>
  <div>文档中的块级元素</div>
  <span>文档中的内联元素</span>
  ```

### 无序列表
* ```html
  <ul>
      <li>项目</li>
      <li>项目</li>
  </ul>
  ```

### 有序列表
* ```html
  <ol>
      <li>第一项</li>
      <li>第二项</li>
  </ol>
  ```

### 自定义列表
* ```html
  <dl>
    <dt>项目 1</dt>
      <dd>描述项目 1</dd>
    <dt>项目 2</dt>
      <dd>描述项目 2</dd>
  </dl>
  ```

### 表格（Tables）
* ```html
  <table border="1">
    <tr>
      <th>表格标题</th>
      <th>表格标题</th>
    </tr>
    <tr>
      <td>表格数据</td>
      <td>表格数据</td>
    </tr>
  </table>
  ```

### 框架（Iframe）
* ```html
  <iframe src="demo_iframe.htm"></iframe>
  ```

### 表单（Forms）
* ```html
  <form action="demo_form.php" method="post/get">
  <input type="text" name="email" size="40" maxlength="50">
  <input type="password">
  <input type="checkbox" checked="checked">
  <input type="radio" checked="checked">
  <input type="submit" value="Send">
  <input type="reset">
  <input type="hidden">
  <select>
  <option>苹果</option>
  <option selected="selected">香蕉</option>
  <option>樱桃</option>
  </select>
  <textarea name="comment" rows="60" cols="20"></textarea>
  </form>
  ```

### 实体（Entities）
* ```html
  &lt; 等同于 <
  &gt; 等同于 >
  &#169; 等同于 ©

### HTML 标签简写及全称

| **标签**    | **英文全称**              | **中文说明**                   |
| ----------- | ------------------------- | ------------------------------ |
| a           | Anchor                    | 锚                             |
| abbr        | Abbreviation              | 缩写词                         |
| acronym     | Acronym                   | 取首字母的缩写词               |
| address     | Address                   | 地址                           |
| alt         | alter                     | 替用(一般是图片显示不出的提示) |
| b           | Bold                      | 粗体（文本）                   |
| bdo         | Direction of Text Display | 文本显示方向                   |
| big         | Big                       | 变大（文本）                   |
| blockquote  | Block Quotation           | 区块引用语                     |
| br          | Break                     | 换行                           |
| cell        | cell                      | 巢                             |
| cellpadding | cellpadding               | 巢补白                         |
| cellspacing | cellspacing               | 巢空间                         |
| center      | Centered                  | 居中（文本）                   |
| cite        | Citation                  | 引用                           |
| code        | Code                      | 源代码（文本）                 |
| dd          | Definition Description    | 定义描述                       |
| del         | Deleted                   | 删除（的文本）                 |
| dfn         | Defines a Definition Term | 定义定义条目                   |
| div         | Division                  | 分隔                           |
| dl          | Definition List           | 定义列表                       |
| dt          | Definition Term           | 定义术语                       |
| em          | Emphasized                | 加重（文本）                   |
| font        | Font                      | 字体                           |
| h1~h6       | Header 1 to Header 6      | 标题1到标题6                   |
| hr          | Horizontal Rule           | 水平尺                         |
| href        | hypertext reference       | 超文本引用                     |
| i           | Italic                    | 斜体（文本）                   |
| iframe      | Inline frame              | 定义内联框架                   |
| ins         | Inserted                  | 插入（的文本）                 |
| kbd         | Keyboard                  | 键盘（文本）                   |
| li          | List Item                 | 列表项目                       |
| nl          | navigation lists          | 导航列表                       |
| ol          | Ordered List              | 排序列表                       |
| optgroup    | Option group              | 定义选项组                     |
| p           | Paragraph                 | 段落                           |
| pre         | Preformatted              | 预定义格式（文本 ）            |
| q           | Quotation                 | 引用语                         |
| rel         | Reload                    | 加载                           |
| s/ strike   | Strikethrough             | 删除线                         |
| samp        | Sample                    | 示例（文本                     |
| small       | Small                     | 变小（文本）                   |
| span        | Span                      | 范围                           |
| src         | Source                    | 源文件链接                     |
| strong      | Strong                    | 加重（文本）                   |
| sub         | Subscripted               | 下标（文本）                   |
| sup         | Superscripted             | 上标（文本）                   |
| td          | table data cell           | 表格中的一个单元格             |
| th          | table header cell         | 表格中的表头                   |
| tr          | table row                 | 表格中的一行                   |
| tt          | Teletype                  | 打印机（文本）                 |
| u           | Underlined                | 下划线（文本）                 |
| ul          | Unordered List            | 不排序列表                     |
| var         | Variable                  | 变量（文本）                   |

### 
```html
<html></html> 文档定义
<head></head> 请求头定义
<boby></boby> 请求主题定义
<h1></h1>  标题
<p></p> 段落
<br/>    空元素,换行
<hr>     分割线
<!-- 注释 -->   注释
<a></a>   定义一个超级链接
```

## HTML属性
```html
  class
id
style
title
<a href="http://www.runoob.com">这是一个链接</a>
<a href="http://www.runoob.com" target="_blank" rel="noopener noreferrer">这是一个链接</a> 新窗口打开页面
```
```html


标签	描述
<b>	定义粗体文本
<em>	定义着重文字
<i>	定义斜体字
<small>	定义小号字
<strong>	定义加重语气
<sub>	定义下标字
<sup>	定义上标字
<ins>	定义插入字
<del>	定义删除字
HTML "计算机输出" 标签
标签	描述
<code>	定义计算机代码
<kbd>	定义键盘码
<samp>	定义计算机代码样本
<var>	定义变量
<pre>	定义预格式文本
HTML 引文, 引用, 及标签定义
标签	描述
<abbr>	定义缩写
<address>	定义地址
<bdo>	定义文字方向
<blockquote>	定义长的引用
<q>	定义短的引用语
<cite>	定义引用、引证
<dfn>	定义一个定义项目。
```

### HTML 头部
```html
<head></head>
<title></title>
<base href="http://www.runoob.com/images/" target="_blank">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style type="text/css"></style>
<meta name="1" content="">
<script></script>
```

font-family
color
font-size

style="text-align: center"

<img src="" alt="test" width="304" height="228">   <map></map>  <area>


```html
<table>	定义表格
<th>	定义表格的表头
<tr>	定义表格的行
<td>	定义表格单元
<caption>	定义表格标题
<colgroup>	定义表格列的组
<col>	定义用于表格列的属性
<thead>	定义表格的页眉
<tbody>	定义表格的主体
<tfoot>	定义表格的页脚

<table border="1">
    <tr>
        <td>row 1, cell 1</td>
        <td>row 1, cell 2</td>
    </tr>
    <tr>
        <td>row 2, cell 1</td>
        <td>row 2, cell 2</td>
    </tr>
</table>
```

## list
```html
<!-- wuxu -->
<ul>
    <li>Coffee</li>
    <li>Milk</li>
</ul>
<!-- youxu -->
<ol>
    <li>Coffee</li>
    <li>Milk</li>
</ol>
<!-- 自定义 -->
<dl>
    <dt>Coffee</dt>
    <dd>- black hot drink</dd>
    <dt>Milk</dt>
    <dd>- white cold drink</dd>
</dl>
```
