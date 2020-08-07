<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/axios-0.18.0.js"></script>

<style>
	.show{
	display:black
	}
	.hidden{
	display:none
	}

</style>

</head>
<body>
<center>
<a href="${pageContext.request.contextPath}/toAdd.action">添加</a>
<div id="did">
<table id="tid" border="1px" :class="flag2">
	<tr>
		<td>选择</td>
		<td>编号</td>
		<td>姓名</td>
		<td>性别</td>
		<td>照片</td>
		<td>生日</td>
		<td>班级</td>
		<td>操作</td>
	</tr>
	
	<tr v-for="(stu,index) in slist">
		<td><input type="checkbox" v-model="ids" :value="stu.sid"></td>
		<td v-text="stu.sid"></td>
		<td v-text="stu.sname">姓名</td>
		<td v-text="stu.sex">性别</td>
		<td>照片</td>
		<td v-text="format(stu.birthday)"></td>
		<td v-text="stu.clazz.cname"></td>
		<td><input type="button" @click="toUpdate(index)" value="修改"></td>
	</tr>
</table>
<input type="button" @click="del" value="删除">
<!--   -->
<form id="fid" action="" :class="flag">
<input type="hidden" v-model="student.sid" ><br/>
	姓名:<input type="text" v-model="student.sname"><br/>
	性别:<input type="radio" value="男" v-model="student.sex">  男
		<input type="radio" value="女" v-model="student.sex">  女<br/>
	图片:<input type="file" ><br/>
	生日:<input type="date" v-model = "student.birthday" ><br/>
	班级: <select v-model="student.cid">
		<option v-for="clazz in clist" :value="clazz.cid" v-text = "clazz.cname"></option>
	</select><br/> 
	<input type="button" @click="update" value="修改">
</form>
</div>
</center>
<script type="text/javascript">
	var table = new Vue({
		el:"#did",
		data:{
			slist:[],
			student:{},
			clist:[],
			flag:'hidden',
			flag2:'show',
			ids:[]
		},
		created(){
			axios.post("${pageContext.request.contextPath}/findAll.action").then(function(res){
				table.slist = res.data;
			});
			axios.post("${pageContext.request.contextPath}/findClazz.action").then(function(res){
				table.clist = res.data;
			})
		},
		methods:{
			format(datetime){
				var year = new Date(datetime).getFullYear();
				var month1= new Date(datetime).getMonth()+1;
				var month = month1<10?"0"+month1:month1;
				var date = new Date(datetime).getDate()<10?"0"+new Date(datetime).getDate():new Date(datetime).getDate();
				return  year+"-"+month+"-"+date
			},
			toUpdate(i){
				this.student = this.slist[i];
				this.student.birthday = this.format(this.student.birthday);
				this.flag="show"
				this.flag2="hidden"
			},
			update(){
				axios.post("${pageContext.request.contextPath}/updateStu.action",table.student).then(function(res){
					if(res.data>0){
						table.flag="hidden";
						table.flag2="show";
						 location.href="${pageContext.request.contextPath}/toShow.action" ;
						
					};
				})
			},
			del(){
				axios.post("${pageContext.request.contextPath}/delStu.action",this.ids).then(function(res){
					if(res.data>0){
						 location.href="${pageContext.request.contextPath}/toShow.action" ;
						
					};
				})
			}
		}
	})
</script>
</body>
</html>