package com.example.fooddeliverysystem.repository;

import com.example.fooddeliverysystem.model.Consumer;
import com.example.fooddeliverysystem.model.Deliver;
import com.example.fooddeliverysystem.model.Order;
import com.example.fooddeliverysystem.model.SalePlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllBySalePlaceAndOrderStatus(SalePlace salePlace, String orderStatus);

    //Requirement 12 - CR
    List<Order> findAllByOrderStatusAndConsumer(String status, Consumer consumer);

    List<Order> findAllByOrderStatus(String status);

    List<Order> findAllByOrderStatusAndDeliver(String status, Deliver deliver);

    List<Order> findAllByConsumer(Consumer consumer);



}
