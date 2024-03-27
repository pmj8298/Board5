package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardMapper boardMapper;

		// /Board/List?menu_id=MENU01
	@RequestMapping("/List")
	public ModelAndView list(MenuVo menuVo) {
		log.info("menuVo : {}", menuVo);
		
		// 메뉴 목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		
		// 게시물 목록
		List<BoardVo> boardList = boardMapper.getBoardList(menuVo); 
		System.out.println(boardList);
		
		String menu_id = menuVo.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/list");
		return mv;
	}
	
		// /Board/WriteForm?menu_id=MENU01
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(MenuVo menuVo) {
		
		String menu_id = menuVo.getMenu_id();
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.setViewName("board/write");
		return mv;
	}
	
	// /Board/Write
	@RequestMapping("/Write")
	public ModelAndView write(BoardVo boardVo) {
		
		// 넘어온 값 Board 에 저장

		boardMapper.insertBoard(boardVo);
		
		String menu_id = boardVo.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return mv;
	}
}
