# StreamBuilder, FutureBuilder 

## FutureBuilder

- async 함수의 값을 받아서 화면에 그려주는 역할을 하는 위젯
- 페이지 이동시 data 는 보존되지 않는다.
- 에러가 날 경우 data는 null로 변경된다.

### 예제로 3가지의 랜더링 타입을 가질 수 있다.

```dart
if (snapshot.hasData) {
  // 데이터가 있는 경우
}
if (snapshot.hasError) {
  // 에러가있을경우
}
// 그외 로딩중인경우
```

### 기본사용법 

```dart
FutureBuilder(
  // 결과를 받을 async 함수를 넣어준다.
  future: getNumber(),
  // 리턴할 위젯(UI)을 적어주는 빌더
  builder: (context, snapshot) {
    // 데이터를 가지고 오고 있을 경우에 로딩화면을 리턴한다.
    // ⛔️ But 두번째 요청때에는 데이터가 있을 것이므로 좋지 않은 방식이다.
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return Center(child: CircularProgressIndicator());
    // }

    // 데이터가 없을때만 로딩을 띄운다. 즉, 한번도 데이터 요청을 하지 않았을시 로딩화면을 보여준다.
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'FutureBuilder',
          style: fontStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // ✅ snapshot.connectionState: waiting, done 2가지 상태를 가진다.
        Text(
          '✅ snapshot.connectionState: ${snapshot.connectionState}',
          style: fontStyle,
        ),
        SizedBox(
          height: 5,
        ),
        // ✅ snapshot.data: Data를 받는다. 대기상태(Waiting)일때는 null
        Text(
          '✅ snapshot.data: ${snapshot.data}',
          style: fontStyle,
        ),
        SizedBox(
          height: 5,
        ),
        // ✅ snapshot.error: 에러 일시 에러메세지를 return, 정상상태에는 null
        // 에러도 캐싱되어있다.
        Text(
          '✅ snapshot.error: ${snapshot.error}',
          style: fontStyle,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('SetState'),
        )
      ],
    );
  },
),
```

## StreamBuilder

```dart
StreamBuilder(
  // 결과를 받을 async* 함수를 넣어준다.
  stream: streamNumbers(),
  // 리턴할 위젯(UI)을 적어주는 빌더
  builder: (context, snapshot) {
    // 데이터를 가지고 오고 있을 경우에 로딩화면을 리턴한다.
    // ⛔️ But 두번째 요청때에는 데이터가 있을 것이므로 좋지 않은 방식이다.
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return Center(child: CircularProgressIndicator());
    // }

    // 데이터가 없을때만 로딩을 띄운다. 즉, 한번도 데이터 요청을 하지 않았을시 로딩화면을 보여준다.
    // if (!snapshot.hasData) {
    //   return Center(child: CircularProgressIndicator());
    // }

    if (snapshot.hasData) {
      // 데이터가 있는 경우
    }
    if (snapshot.hasError) {
      // 에러가있을경우
    }
    // 그외 로딩중인경우

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'StreamBuilder',
          style: fontStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // ✅ snapshot.connectionState: waiting, active, done 3가지 상태를 가진다.
        Text(
          '✅ snapshot.connectionState: ${snapshot.connectionState}',
          style: fontStyle,
        ),
        SizedBox(
          height: 5,
        ),
        // ✅ snapshot.data: Data를 받는다. 대기상태(Waiting)일때는 null
        Text(
          '✅ snapshot.data: ${snapshot.data}',
          style: fontStyle,
        ),
        SizedBox(
          height: 5,
        ),
        // ✅ snapshot.error: 에러 일시 에러메세지를 return, 정상상태에는 null
        // 에러도 캐싱되어있다.
        Text(
          '✅ snapshot.error: ${snapshot.error}',
          style: fontStyle,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('SetState'),
        )
      ],
    );
  },
),
```