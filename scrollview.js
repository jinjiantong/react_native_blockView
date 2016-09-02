import React,{Component} from 'react';
import {
  View,
  Text,
  ScrollView,
  Navigator,
  TouchableWithoutFeedback,
  Dimensions,
  RefreshControl,
  DeviceEventEmitter,
  requireNativeComponent
} from 'react-native';
var RCTBlockView = requireNativeComponent('RCTBlockView', null);

let { width, height } = Dimensions.get('window');

class testView extends Component {

 constructor(props) {
     super(props);
  }

  render() {
          return (
            <ScrollView
                style ={{flex:1,backgroundColor:'#f5f8fa'}}
                showsHorizontalScrollIndicator = {false}
                showsVerticalScrollIndicator = {false}
                alwaysBounceHorizontal = {false} 
                directionalLockEnabled = {true}
                alwaysBounceVertical = {false}
                horizontal = {false}
                pagingEnabled = {false}
                ref={(ref) => this.scrollView = ref}
                scrollEnabled = {this.state.scrollEnabled}
                contentContainerStyle={{backgroundColor: 'white'}}
                refreshControl={ // 下拉刷新的头部
                <RefreshControl
                    refreshing={false}
                    onRefresh={() => this.startRefresh(context)}
                    progressBackgroundColor="white"
                    colors = {['#59aeef']}
                
                />
                }
                >
                //这是拦截层,用来拦截touche事件 原生里通过componentID区分组件
                <RCTBlockView componentID = {'scrollView'}>
                 <View>
                 //这是我们需要移动的view
                  <View onMoveShouldSetResponderCapture={(event)=>{dy=0;previousY = 0;return true}}
                        onResponderTerminationRequest = {(event)=>{return true}}
                        onResponderRelease = {(event)=>{}}
                        onResponderMove={(event)=>{
                           //这里做移动动画
                        }}/>
                        //这是拦截层,用来拦截touche事件
                        <RCTBlockView componentID = {'animationView'}>
                            <View/>
                            <View/>
                            <View/>
                        </RCTBlockView>
                 </View>
                </RCTBlockView>
            </ScrollView>
          )
  }
}

module.exports = testView;
