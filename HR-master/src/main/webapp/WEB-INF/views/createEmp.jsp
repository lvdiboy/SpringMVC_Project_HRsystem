<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@include file="/WEB-INF/views/includes/navi.jsp"%>
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Create Employee
            <small></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Create Employee </a></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

        <div class="row">
            <div class="col-md-12">
                <%--post触发@PostMapping("/createEmp") 大概是因为本身就在createEmp上的post请求，自动对应controller里的post方法
                     &lt;%&ndash;id表示这张表的名字&ndash;%&gt;--%>
                <form:form action="" method="POST" id="create_new_emp_form" modelAttribute="emp">
                    <div class="box box-primary">
                            <%--<div class="box-header">--%>
                            <%--<h3 class="box-title"></h3>--%>

                            <%--</div>第一行--%>
                        <div class="box-body">
                            <!-- Date -->
                            <div class="row">
                                <!-- Text -->
                                <div class="col-md-2">
                                    <spring:bind path="firstName">
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label>First Name</label>
                                            <form:input path="firstName" type="text" name="firstName" class="form-control" placeholder="Enter ..." />
                                            <form:errors path="firstName" cssClass="help-block"/>
                                        </div>
                                    </spring:bind>
                                </div>
                                <!-- Text -->
                                <div class="col-md-2">
                                    <spring:bind path="lastName">
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label>Last Name</label>
                                            <form:input type="text" path="lastName" class="form-control" placeholder="Enter ..."/>
                                            <form:errors path="lastName" cssClass="help-block"/>
                                        </div>
                                    </spring:bind>
                                </div>
                                <%--这里要通过选择department 来自动获得deptid--%>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Department</label>
                                        <form:select class="form-control" path="deptId"  >
                                            <%--&lt;%&ndash;这是在controller里直接获取到的&ndash;%&gt;  此处id代表了department里id的数据--%>
                                            <form:options items="${deptList}" itemLabel="name" itemValue="id"/>
                                        </form:select>
                                    </div>
                                </div>
                                <!-- /.form group第一行结束-->
                            </div>
                            <%--第二行--%>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Start Date:</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <form:input type="text" path="startDate" class="form-control pull-right" id="datepicker"/>
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Contact Phone</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                            <form:input type="text" path="phone" class="form-control" placeholder="Phone"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Contact Email</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                            <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                                                                      <%--path是定位到VO变量的参数？--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <form:select class="form-control" path="statusId" items="${statusCodeList}" itemLabel="value" itemValue="cId">
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <%--第二行结束--%>
                            <%--第三行地址--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                            <form:input type="text" path="address" class="form-control" placeholder="Enter ..."/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <%--第三行地址结束--%>
                        </div>
                        <!-- /.box-body 结束-->
                        <div class="box-footer">
                            <c:if test="${id != null}"><a class="btn btn-default btn-arrow-left" href="/viewProj" role="button">Cancel</a></c:if>
                            <a class="btn btn-default btn-arrow-left" href="/viewProj" role="button">Cancel</a>

                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" id="reset_button" class="btn btn-default">Reset</button>

                        </div>
                        <div id="create_new_form_overlay" style="display: none" class="overlay">  <%----%>
                            <i class="fa fa-refresh fa-spin"></i>
                        </div>
                    </div>
                </form:form>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->
        </div>

    </section>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>
<script>
    //Date picker
    $('#datepicker').datepicker({
        autoclose: true
    })

    $(function(){
        $('#reset_button').on('click',function(e){
            $('#warn_msg').text("Are you sure to reset the form?");
            $("#warn-dialog-ok-button").click(function(){ window.location.replace("/createEmp");});
            $('#modal-warn').modal('toggle');
        });
    });
    $('#create_new_emp_form').submit(function() {
        enableOverlay('create_new_form_overlay');
        return true;
    });
</script>