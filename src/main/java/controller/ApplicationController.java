package controller;

import java.io.InputStream;

import context.RequestContext;
import context.ResponseContext;

public interface ApplicationController {
	RequestContext getRequest(Object request);
	ResponseContext handleRequest(RequestContext req, InputStream file);
	void handleResponse(RequestContext req, ResponseContext res);
}
