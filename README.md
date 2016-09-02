# react_native_blockView

背景
scrollview里 子组件view里添加 触摸事件后 （pan,move）
当移动view的时候 触发scrollview的滑动

思路
通过添加拦截层 找到触发触摸事件的组件
然后通过该组件找scrollview禁止滑动
当事件结束以后设置scrollview允许滑动

该拦截层是自定义rn组件
有一个componentID属性来标识组件
