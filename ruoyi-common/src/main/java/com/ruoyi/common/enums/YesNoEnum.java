package com.ruoyi.common.enums;


public enum YesNoEnum {

    NO(0),
    YES(1);

    private Integer value;

    private YesNoEnum(Integer s) {
        this.value = s;
    }

    public Integer getValue() {
        return this.value;
    }
}
