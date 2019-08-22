; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:128:128"

declare void @foo(i32 %x)

define i32 @compare_against_arbitrary_value(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, %c
  %cmp2 = icmp slt i32 %x, %c
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero(i32 %x) {
; CHECK-LABEL: @compare_against_zero(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 0
  %cmp2 = icmp slt i32 %x, 0
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_one(i32 %x) {
; CHECK-LABEL: @compare_against_one(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 1
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 1
  %cmp2 = icmp slt i32 %x, 1
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_two(i32 %x) {
; CHECK-LABEL: @compare_against_two(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 2
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 2
  %cmp2 = icmp slt i32 %x, 2
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_three(i32 %x) {
; CHECK-LABEL: @compare_against_three(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 3
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 3
  %cmp2 = icmp slt i32 %x, 3
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_four(i32 %x) {
; CHECK-LABEL: @compare_against_four(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 4
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 4
  %cmp2 = icmp slt i32 %x, 4
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_five(i32 %x) {
; CHECK-LABEL: @compare_against_five(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 5
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 5
  %cmp2 = icmp slt i32 %x, 5
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_six(i32 %x) {
; CHECK-LABEL: @compare_against_six(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 6
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 6
  %cmp2 = icmp slt i32 %x, 6
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

; Same as @compare_against_arbitrary_value, but now the three-way comparison
; returns not idiomatic comparator's result (-1, 0, 1) but some other constants.
define i32 @compare_against_arbitrary_value_non_idiomatic_1(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_non_idiomatic_1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 425)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, %c
  %cmp2 = icmp slt i32 %x, %c
  %select1 = select i1 %cmp2, i32 -6, i32 425
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero_non_idiomatic_add(i32 %x) {
; CHECK-LABEL: @compare_against_zero_non_idiomatic_add(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 425)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 0
  %cmp2 = icmp slt i32 %x, 0
  %select1 = select i1 %cmp2, i32 -6, i32 425
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

; Same as @compare_against_arbitrary_value, but now the three-way comparison
; returns not idiomatic comparator's result (-1, 0, 1) but some other constants.
define i32 @compare_against_arbitrary_value_non_idiomatic_2(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_non_idiomatic_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 425)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, %c
  %cmp2 = icmp slt i32 %x, %c
  %select1 = select i1 %cmp2, i32 -5, i32 425
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero_non_idiomatic_or(i32 %x) {
; CHECK-LABEL: @compare_against_zero_non_idiomatic_or(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 425)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i32 %x, 0
  %cmp2 = icmp slt i32 %x, 0
  %select1 = select i1 %cmp2, i32 -5, i32 425
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_arbitrary_value_type_mismatch(i64 %x, i64 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_type_mismatch(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i64 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i64 %x, %c
  %cmp2 = icmp slt i64 %x, %c
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero_type_mismatch_idiomatic(i64 %x) {
; CHECK-LABEL: @compare_against_zero_type_mismatch_idiomatic(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i64 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i64 %x, 0
  %cmp2 = icmp slt i64 %x, 0
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero_type_mismatch_non_idiomatic_1(i64 %x) {
; CHECK-LABEL: @compare_against_zero_type_mismatch_non_idiomatic_1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i64 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i64 %x, 0
  %cmp2 = icmp slt i64 %x, 0
  %select1 = select i1 %cmp2, i32 -7, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

define i32 @compare_against_zero_type_mismatch_non_idiomatic_2(i64 %x) {
; CHECK-LABEL: @compare_against_zero_type_mismatch_non_idiomatic_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i64 [[X:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;

entry:
  %cmp1 = icmp eq i64 %x, 0
  %cmp2 = icmp slt i64 %x, 0
  %select1 = select i1 %cmp2, i32 -6, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}

declare void @use1(i1)
define i32 @compare_against_fortytwo_commutatibility_0(i32 %x) {
; CHECK-LABEL: @compare_against_fortytwo_commutatibility_0(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], 42
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 84
;
entry:
  %cmp1 = icmp eq i32 %x, 42
  %cmp2 = icmp slt i32 %x, 42
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 84
}
define i32 @compare_against_fortytwo_commutatibility_1(i32 %x) {
; CHECK-LABEL: @compare_against_fortytwo_commutatibility_1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[X:%.*]], 42
; CHECK-NEXT:    call void @use1(i1 [[CMP1]])
; CHECK-NEXT:    [[CMP2:%.*]] = icmp slt i32 [[X]], 42
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 -1, i32 1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 [[SELECT1]], i32 0
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 84
;
entry:
  %cmp1 = icmp ne i32 %x, 42 ; inverted
  call void @use1(i1 %cmp1)
  %cmp2 = icmp slt i32 %x, 42
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 %select1, i32 0 ; swapped
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 84
}
define i32 @compare_against_fortytwo_commutatibility_2(i32 %x) {
; CHECK-LABEL: @compare_against_fortytwo_commutatibility_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[X:%.*]], 42
; CHECK-NEXT:    [[CMP2:%.*]] = icmp sgt i32 [[X]], 41
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 1, i32 -1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 0, i32 [[SELECT1]]
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 84
;
entry:
  %cmp1 = icmp eq i32 %x, 42
  %cmp2 = icmp sgt i32 %x, 41 ; inverted
  %select1 = select i1 %cmp2, i32 1, i32 -1 ; swapped
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 84
}
define i32 @compare_against_fortytwo_commutatibility_3(i32 %x) {
; CHECK-LABEL: @compare_against_fortytwo_commutatibility_3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[X:%.*]], 42
; CHECK-NEXT:    call void @use1(i1 [[CMP1]])
; CHECK-NEXT:    [[CMP2:%.*]] = icmp sgt i32 [[X]], 41
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 1, i32 -1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 [[SELECT1]], i32 0
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 84
;
entry:
  %cmp1 = icmp ne i32 %x, 42 ; inverted
  call void @use1(i1 %cmp1)
  %cmp2 = icmp sgt i32 %x, 41 ; inverted
  %select1 = select i1 %cmp2, i32 1, i32 -1 ; swapped
  %select2 = select i1 %cmp1, i32 %select1, i32 0 ; swapped
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 84
}

define i32 @compare_against_arbitrary_value_commutativity0(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_commutativity0(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    br i1 [[TMP0]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 1)
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
entry:
  %cmp1 = icmp eq i32 %x, %c
  %cmp2 = icmp slt i32 %x, %c
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}
define i32 @compare_against_arbitrary_value_commutativity1(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_commutativity1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[CMP2:%.*]] = icmp sgt i32 [[C]], [[X]]
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 1, i32 -1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 0, i32 [[SELECT1]]
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
entry:
  %cmp1 = icmp eq i32 %x, %c
  %cmp2 = icmp sgt i32 %c, %x ; inverted
  %select1 = select i1 %cmp2, i32 1, i32 -1 ; swapped
  %select2 = select i1 %cmp1, i32 0, i32 %select1
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}
define i32 @compare_against_arbitrary_value_commutativity2(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_commutativity2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    call void @use1(i1 [[CMP1]])
; CHECK-NEXT:    [[CMP2:%.*]] = icmp slt i32 [[X]], [[C]]
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 -1, i32 1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 [[SELECT1]], i32 0
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
entry:
  %cmp1 = icmp ne i32 %x, %c ; inverted
  call void @use1(i1 %cmp1)
  %cmp2 = icmp slt i32 %x, %c
  %select1 = select i1 %cmp2, i32 -1, i32 1
  %select2 = select i1 %cmp1, i32 %select1, i32 0 ; swapped
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}
define i32 @compare_against_arbitrary_value_commutativity3(i32 %x, i32 %c) {
; CHECK-LABEL: @compare_against_arbitrary_value_commutativity3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ne i32 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    call void @use1(i1 [[CMP1]])
; CHECK-NEXT:    [[CMP2:%.*]] = icmp sgt i32 [[C]], [[X]]
; CHECK-NEXT:    [[SELECT1:%.*]] = select i1 [[CMP2]], i32 1, i32 -1
; CHECK-NEXT:    [[SELECT2:%.*]] = select i1 [[CMP1]], i32 [[SELECT1]], i32 0
; CHECK-NEXT:    [[COND:%.*]] = icmp sgt i32 [[SELECT2]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[CALLFOO:%.*]], label [[EXIT:%.*]]
; CHECK:       callfoo:
; CHECK-NEXT:    call void @foo(i32 [[SELECT2]])
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
entry:
  %cmp1 = icmp ne i32 %x, %c ; inverted
  call void @use1(i1 %cmp1)
  %cmp2 = icmp sgt i32 %c, %x ; inverted
  %select1 = select i1 %cmp2, i32 1, i32 -1 ; swapped
  %select2 = select i1 %cmp1, i32 %select1, i32 0 ; swapped
  %cond = icmp sgt i32 %select2, 0
  br i1 %cond, label %callfoo, label %exit

callfoo:
  call void @foo(i32 %select2)
  br label %exit

exit:
  ret i32 42
}
