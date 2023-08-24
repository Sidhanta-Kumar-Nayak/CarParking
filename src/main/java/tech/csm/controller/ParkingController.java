package tech.csm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tech.csm.model.Booking;
import tech.csm.model.Place;
import tech.csm.model.User;
import tech.csm.model.UserDetails;
import tech.csm.service.BookingService;
import tech.csm.service.PlaceService;
import tech.csm.service.UserDetailsService;
import tech.csm.service.UserService;

@Controller
@RequestMapping("/homePage")
public class ParkingController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private BookingService bookingService;
	
	@GetMapping("/menu")
	public String menu(Model model) {
		model.addAttribute("home", "home");
		return "homepage";
	}

	@GetMapping("/user")
	public String user() {

		return "accountPage";
	}

	@GetMapping("/admin")
	public String admin() {

		return "adminPage";
	}
	
	@GetMapping("/staff")
	public String staff() {
		
		return "staff";
	}
	

	@PostMapping("/validateDetails")
	public String validate(@RequestParam("userId") Integer uId, @RequestParam("password") String password,
			RedirectAttributes rd,HttpServletRequest req) {

		try {
			System.out.println(uId);
			User user = null;
			try {
				user = userService.findUserById(uId);
			} catch (Exception e) {
				user = null;
			}

			if (user != null) {
				System.out.println(user);
				if (user.getPassword().equals(password)) {
					if(user.getRole().equalsIgnoreCase("user")) {
						req.getSession().setAttribute("userdtls",userDetailsService.findDetailsById(uId));
						System.out.println(userDetailsService.findDetailsById(uId)+" here ###");
						Date date = new Date();
						req.getSession().setAttribute("currDate", new SimpleDateFormat("yyyy-MM-dd").format(date));
						rd.addFlashAttribute("msg", "success");
						return "redirect:./admin";
						
					}else {
						req.getSession().setAttribute("userdtls",userDetailsService.findDetailsById(uId));
						System.out.println(userDetailsService.findDetailsById(uId)+" here ###");
						Date date = new Date();
						req.getSession().setAttribute("currDate", new SimpleDateFormat("yyyy-MM-dd").format(date));
						rd.addFlashAttribute("msg", "success");
						return "redirect:./staff";
					}
				} else {
					
					rd.addFlashAttribute("msg", "pass");
					return "redirect:./menu";
				}
			} else {
				rd.addFlashAttribute("msg", "failed");
				return "redirect:./menu";
			}

		} catch (Exception e) {
			
			System.out.println("wrong input format");
			rd.addFlashAttribute("msg", "failed");
			
			return "redirect:./menu";

		}

	}
	
	@GetMapping("/dashboard")
	public String dashboard(@RequestParam("uId") Integer uId,Model model) {
		System.out.println(uId+"dash");
		List<Booking> bookList=bookingService.findAllByUserId(uId);
		model.addAttribute("bookings",bookList);
		
		
		
		return "adminPage";
	}
	
	
	@GetMapping("/booking")
	public String booking(Model model) {
		
		List<Place> places = placeService.findAllPlaces();
		
		System.out.println(places);
		String date = new SimpleDateFormat().format(new Date());
		System.out.println(date);
		model.addAttribute("placeList",places);
		model.addAttribute("booking", "yes");
		
		return "adminPage";
	}
	
	@GetMapping("/createAccount")
	public String createAccount(Model model) {

		model.addAttribute("create", "yes");
		
		return "homepage";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@RequestParam("name") String name,
			@RequestParam("userId") Integer userId,
			@RequestParam("password") String password,
			@RequestParam("carName") String cName,
			@RequestParam("carNumber") String cNumber,
			@RequestParam("exp") Integer exp,
			@RequestParam("dob")@DateTimeFormat(pattern = "yyyy-MM-dd") Date dob,
			@RequestParam("phoneNo") String phoneNo,
			@RequestParam("email") String email,Model model,RedirectAttributes rd) {
		
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		user.setUserName(name);
		user.setRole("user");
		
		User currUser = userService.saveUser(user);
		
		UserDetails userdtls= new UserDetails();
		userdtls.setUser(currUser);
		userdtls.setCarName(cName);
		userdtls.setEmail(email);
		userdtls.setDrivingExp(exp);
		userdtls.setDate(dob);
		userdtls.setPhoneNo(phoneNo);
		userdtls.setCarNumber(cNumber);
		
		UserDetails currUserDtls = userDetailsService.saveUserdtls(userdtls);
		
		rd.addFlashAttribute("msg","success");
		
		return "redirect:./menu";
	}
	
	@GetMapping("/getPrice")
	public void getprice(@RequestParam("pId") Integer pId, HttpServletResponse resp) throws IOException {

		Place place = placeService.findById(pId); 
		
		String re = "<div class='row mt-1'><div class='col-md-3'><label class='fontFantasy'>Price( in Rs)</label><input name='price' class='form-control' type='text' value='"+place.getPrice()+"' required='required'></div>";
		re=re+"<div class='col-md-3'>"
				+ "<label class='fontFantasy'>Seat Available</label>"
				+ "<input disabled='disabled' class='form-control' value='"+place.getSeats()+"'>"
				+ "<input type='hidden' class='form-control' name='seats' value='"+place.getSeats()+"'>"
				+ "</div>"
				+ "</div>";
		resp.getWriter().print(re);

	}
	
	@PostMapping("/book")
	public String book(@RequestParam("userId") Integer id,
			@RequestParam("doP") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
			@RequestParam("place") Integer place,
			@RequestParam("price") Double price,
			@RequestParam("seats") Integer seats,RedirectAttributes rd) {
		
		Booking booking = new Booking();
		
		System.out.println(seats+"########");
		
		booking.setUser(userService.findUserById(id));
		booking.setDateOfBooking(date);
		booking.setPlace(placeService.findById(place));
		booking.setPrice(price);
		
		if(placeService.findById(place).getSeats()>0) {
			Booking savedBooking = bookingService.saveBooking(booking);
			if(savedBooking!=null) {
				rd.addFlashAttribute("msg","saved");
			}
		}else {
			rd.addFlashAttribute("msg","failed");
			return "redirect:./dashboard?uId="+id;
		}
		return "redirect:./dashboard?uId="+id;
	}
	
	@GetMapping("/parking")
	public String veiwParking(Model model) {
		List<Place> placeList=placeService.findAllPlaces();
		model.addAttribute("placeList", placeList);
		model.addAttribute("parking","yes");
		
		return "staff";
	}
	
	@GetMapping("/getDetails")
	public void getDetails(@RequestParam("pId") Integer pId, HttpServletResponse resp) throws IOException {
		
		Place place = placeService.findById(pId);
		String re ="";
		
		   re=re+"<input disabled='disabled' class='form-control' value='"+place.getPrice()+"'>"
				+ "<input type='hidden' class='form-control' name='price' value='"+place.getPrice()+"'>";
//				+ "<label>Available Seats</label>"
//				+ "<input disabled='disabled' class='form-control' value='"+place.getSeats()+"' >";
		
		resp.getWriter().print(re);
	}
	
	@GetMapping("/getSeats")
	public void getSeats(@RequestParam("pId") Integer pId, HttpServletResponse resp,Model model,HttpServletRequest req) throws IOException {
		Place place = placeService.findById(pId);
		String re ="<input disabled='disabled' class='form-control' value='"+place.getSeats()+"' >";
	
		
		resp.getWriter().print(re);
	}
	
	@GetMapping("/add")
	public String addSeat(@RequestParam("pId") Integer placeId,
			@RequestParam("add") Integer addSeats,Model model,RedirectAttributes rd) {
		
		System.out.println(placeId+"####"+addSeats);
		
		Place place = placeService.findById(placeId);
		
		System.out.println(place.getSeats());
		
		place.setSeats(place.getSeats()+addSeats);
		
		Place addPlace = placeService.addSeatsToPlace(place);
		
		System.out.println(addPlace);
		
		if(addPlace !=null) {
			rd.addFlashAttribute("msg","add");
			return "redirect:./parking";
		}else {
			return "redirect:./parking";
		}
		
		
	}

	@GetMapping("/delete")
	public String deleteSeat(@RequestParam("pId") Integer placeId,
			@RequestParam("delete") Integer delSeats,Model model,RedirectAttributes rd) {
		
		System.out.println(placeId+"####"+delSeats);
		
		Place place = placeService.findById(placeId);
		
		System.out.println(place);
		
		place.setSeats(place.getSeats()-delSeats);
		
		if(place.getSeats()!=0) {
			if(place.getSeats()-delSeats>=0) {
				Place addPlace = placeService.addSeatsToPlace(place);
				return "redirect:./parking";
			}else {
			rd.addFlashAttribute("msg","failed");
			return "redirect:./parking";
			}
		}else {
			rd.addFlashAttribute("msg","failed");
			return "redirect:./parking";
		}
			
		
			
	}
	
	
	@GetMapping("/manageBooking")
	public String manageBooking(Model model) {
		
		List<Booking> bookingList=bookingService.findByPendingStatus();
		
		System.out.println(bookingList);
		
		model.addAttribute("bookingList",bookingList);
		
		return "staff";
	}
	
	@GetMapping("/approve")
	public String approve(@RequestParam("bId") Integer bId,RedirectAttributes rd) {
		
		Booking booking = bookingService.findById(bId);
		
		booking = bookingService.saveBooking(booking);
		System.out.println(booking);
		if(booking !=null) {
			rd.addFlashAttribute("msg","approve");
		}
		
		return "redirect:./manageBooking";
	}
}
