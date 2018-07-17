package com.ideaall.infinite.utill;

public class PageMaker {

	private int page;
	private int count;
	private int start;
	private int end;
	private boolean prev;
	private boolean next;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		if (page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setCount(Integer count) {
		if (count < 1) {
			return;
		}
		this.count = count;
		System.out.println("총 컬럼 갯수 = " + count);
		calcPage();
	}

	private void calcPage() { // page변수는 현재 페이지번호
		int tempEnd = (int) (Math.ceil(page / 10.0) * 10); // 현재 페이지번호를 기준으로 끝 페이지를 계산한다.
		System.out.println("page = " + page);
		System.out.println("tempEnd = " + tempEnd);
		System.out.println("this.count =" + this.count); // 시작 페이지 계산
		this.start = tempEnd - 9;

		if (tempEnd * 10 > this.count) { // 가상으로 계산한 tempEnd크기가 실제 count보다 많을경우
			this.end = (int) Math.ceil(this.count / 10.0);
		} else {
			this.end = tempEnd; // 실제 count가 tempEnd보다 많을경우
		}
		System.out.println("this.end = " + this.end);
		this.prev = this.start != 1;
		this.next = this.end * 10 < this.count;
	}

}
