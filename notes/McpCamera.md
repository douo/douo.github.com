# McpCamera

## startSurveyCamera

查勘拍照不分捡

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
callbackContext |  |

## startSurveyVehicleCamera

查勘车辆拍照

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
licenseNo | 车牌号 |
port | 标的车: A  ,三者车: B1 ，B2 。。。。 |
carId | 车辆ID 用于标识是哪一辆车 |
callbackContext |  |

## startDocumentCamera

单证拍照

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
damageCaseCode | 01 单方事故 02 双方事故 03 多方事故 99 其他 |
flag | 0： 基本单证 1： 车辆单证 4:  事故证明 3： 财产 9: 其它 |
lFlag | 自赔通赔标志位 |
callbackContext |  |

## startVehicleDocumentCamera

车辆单证拍照

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
damageCaseCode | 01 单方事故 02 双方事故 03 多方事故 99 其他 |
licenseNo | 车牌号 |
port | 标的车: A  ,三者车: B1 ，B2 。。。。 |
carId | 车辆ID 用于标识是哪一辆车 |
lFlag | 自赔通赔标志位 |
callbackContext |  |

## startLossCamera

定损拍照

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
callbackContext |  |

## startPartCamera

配件拍照

### 参数列表

参数名 | 说明 |
---|---|
taskId | 任务id |
registno | 报案号 |
partName | 配件名称 |
partId | 配件ID |
callbackContext |  |

## startOfflineCamera

启动离线拍照，能否拍照由原生判断，前端不用再判断，直接调用。
 需要回显错误信息

### 参数列表

参数名 | 说明 |
---|---|
callbackContext |  |

## getTaskGallery



### 参数列表

参数名 | 说明 |
---|---|

## getOfflineGallery



### 参数列表

参数名 | 说明 |
---|---|

