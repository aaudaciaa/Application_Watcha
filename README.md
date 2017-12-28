# Watcha clone app
fake 왓챠 based on rails
------

## 0. 영화 정보(Movie -> 직접 만들기)
- model : Movie(title, poster, genre, nation, director)
- controller : movies
- movies#index (모든 영화정보를 보여주는 root 페이지)
- movies#show (하나의 영화를 상세히 보여주는 페이지)

- 관리지만 CRUD 할 수 있다.

## 1. 영화 Review
- 로그인 된 유저 : 점수를 줄 수 있다. comment도 달 수 있다.
- 평점 - rating: integer
- 리뷰 - comment: string
- user_id, movie_id
- Movie has_many :reviews
- Review belongs_to :movies
- User has_many :reviews
- Review belongs_to :user


## 2. 게시판(Post -> Scaffold)
- Scaffold 사용해서 아래적은거 만들기 ('rails g scaffold Post [옵션]')
- title: String, content: text, user_id: integer
- User has_many :posts
- Post belongs_to :users

- 로그인 안된 유저 : Read만 가능
- 로그인 된 유저 : CRUD 모두 가능( Delete는 본인의 글만 가능)
- 관리자 : CRUD 모두 가능 (모든 글 Delete 가능)
- 댓글(model: Comment)

## 3. 유저(User -> Devise)
- signup, login, ... (O)
- 관리자 / 일반 유저로 나눔 (O)
- 한글버전
- view 수정 가능
- nickname이라는 칼럼을 추가함
  * 추가방법
    1. devise 모델 수정
```ruby
    t.string :nickname, null :false, default : ""
```
    2. `app/controller/application_controller.rb`에 아래 코드 추가
```ruby
    class ApplicationController < ActionController::Base
      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname]) # 추가할 유저 정보를 keys: [] 배열 안에 넣어준다.
      end
    end
```

## 4. 사진 업로드

## 5. 유저 역할 구분 / 관리자 페이지
- User model ->role, :stirng, default: "user"
- role = ["user", "manager", "admin"] (유저는 3개의 역할 군으로 나눠져 있다.)
- 
