clear all; close all; echo on;
h = [1,2,3,4],
v = [5;6;7;8],

length(h),
size(v*h),  % 4x4

a=h*h,
A=v*v,
a=v*A,
b=A*h,

% incorrect dimensions