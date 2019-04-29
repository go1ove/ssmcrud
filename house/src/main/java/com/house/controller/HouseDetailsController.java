package com.house.controller;

import com.house.entity.House;
import com.house.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HouseDetailsController {

    @Autowired
    private IHouserService service;

    @RequestMapping("/toDetailsPage")
    public String toDetailsPage(int id, HttpServletRequest request) {
        House HouseDetails = service.findHouseDetailsById(id);
        List<String> list = new ArrayList<String>();
        String[] split = HouseDetails.getHouseDetailsImg().split("~");
        for (int i = 0; i < split.length; i++) {
            list.add(split[i]);
        }
        request.getSession().setAttribute("Details", HouseDetails);
        request.getSession().setAttribute("DetailsImg", list);
        return "housedetails.jsp";
    }
}
