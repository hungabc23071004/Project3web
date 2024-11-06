<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListUrl" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-content">



    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý tòa nhà</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
<%--                        <small>--%>
<%--                            <i class="ace-icon fa fa-angle-double-right"></i>--%>
<%--                            overview &amp; stats--%>
<%--                        </small>--%>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 ">
                        <div class="widget-box ui-sortable-handle" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm </h5>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif; ">
                                <div class="widget-main" >
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListUrl}" method="GET">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-6">
                                                        <label class="name">Tên tòa nhà</label>
<%--                                                        <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                            <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label class="name">Diện tích sàn</label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                            <form:input class="form-control" path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-2">
                                                        <label class="name">Quận</label>
                                                        <form:select type="text" class="form-control" path="district">
                                                            <form:option value="">---Chọn Quận---</form:option>
                                                            <form:options items="${districts}"></form:options>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Phường</label>
                                                        <form:input class="form-control" path="ward"/>
<%--                                                    <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Đường</label>
                                                        <form:input class="form-control" path="street"/>
<%--                                                    <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-4">
                                                        <label class="name">Số tầng hầm</label>
                                                        <form:input class="form-control" path="numberOfBasement"/>
<%--                                                    <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>

                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hướng</label>
                                                        <form:input class="form-control" path="direction"/>
<%--                                                    <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hạng</label>
                                                        <form:input class="form-control" path="level"/>
<%--                                                    <input type="number" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">

                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích từ</label>
                                                        <form:input class="form-control" path="areaFrom"/>
<%--                                                    <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích đến</label>
                                                        <form:input class="form-control" path="areaTo"/>
<%--                                                    <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê từ</label>
                                                        <form:input class="form-control" path="rentPriceFrom"/>
<%--                                                    <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê đến</label>
                                                        <form:input class="form-control" path="rentPriceTo"/>
<%--                                                        <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-5">
                                                        <label class="name">Tên quản lý</label>
                                                        <form:input class="form-control" path="managerName"/>
<%--                                                        <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">--%>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">SDT quản lý</label>
                                                        <form:input class="form-control" path="managerPhone"/>
<%--                                                        <input type="text" class="form-control" name="managerPhoneNumber" value="${modelSearch.managerPhoneNumber}">--%>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label class="name">Nhân viên</label>
                                                        <form:select type="text" class="form-control" path="staffId">
                                                            <form:option value="">---Chọn Nhân Viên---</form:option>
                                                            <form:options items="${listStaffs}"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                      <form:checkboxes items="${typeCodes}" path="typeCode" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                </div>

                                </form:form>

                            </div>
                        </div>



                        <div class="pull-right">
                            <a href="/admin/building-edit">
                            <button class="btn btn-info" title="Thêm tòa nhà">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                            </a>
                            <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>


                        </div>
                    </div>
                </div>

                <!-- Bảng danh sách -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" style="margin: 4em 0 1.5em " class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" name="checkList" value="" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>Số diện thoại quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>Diện tích thuê</th>
                                <th>Diện tích trống</th>
                                <th>Giá thuê</th>
                                <th>Phí dịch vụ</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>


                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildingList}">
                                <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td >${item.numberOfBasement}</td>
                                <td >${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.emptyArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.serviceFee}</td>
                                <td>${item.brokerageFee}</td>

                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assingmentBuilding(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>

                                    </div>


                                </td>
                            </tr>


                            </c:forEach>

                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<div class="modal fade" id="assingmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table  class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssingmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

<script>
    function assingmentBuilding(buildingId){
        $('#assingmentBuildingModal').modal();
        loadStaff(buildingId)
        $('#buildingId').val(buildingId);

     function loadStaff(buildingId){
     $.ajax({
             type: "GET",
                url: "${buildingAPI}/"+buildingId+"/staffs",
                data: JSON.stringify(buildingId),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                  var row='';
                  $.each(response.data, function (index,item){
                        row+= ' <tr>';
                        row+= ' <td className="text-center"><input type="checkbox" value= '+item.staffId +' id="checkbox_'+ item.staffId+'" class="check-box-element" '+item.checked+'/></td>';
                        row += '<td > '+item.fullName + '</td>';
                        row+='</tr> ';
                  });
                  $('#staffList tbody').html(row);
                  console.info("Succes")
                },
                error: function(response){
                    window.location.href="<c:url value="/admin/admin/building-list?message=erro"/>";
                  console.log(response);
                }
        });
     }
}
    $('#btnAssingmentBuilding').click(function(e){
         e.preventDefault();
            var data ={};
            data['buildingId'] =$('#buildingId').val();
            var staffs =$('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs']= staffs;

            if(data['staffs']!=''){
                assignment(data);
            }
            console.log("OK");
    });
    $('#btnSearchBuilding').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    });
    function assignment(data){
            $.ajax({
                type: "POST",
                url: "${buildingAPI}"+"/assignment",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                    console.info("Success");
                },
                error: function(response){
                    console.log(response);
                }
              })
        }
    function deleteBuilding(id){
         var buildingId=[id];
         deleteBuildings(buildingId);
    }
    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var data={};
        var buildingIds= $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });
    function deleteBuildings(data){
           $.ajax({
                type: "DELETE",
                url: "${buildingAPI}/"+data,
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                  console.log(response);
                  location.reload();
                },
                error: function(response){
                  console.log(response);
                  location.reload();
                }
            });
    }
</script>
</body>
</html>
